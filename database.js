import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config()
const USER_ID = 1;
const pool = mysql.createPool({
    host:process.env.MYSQL_HOST,
    user:process.env.MYSQL_USER,
    password:process.env.MYSQL_PASSWORD,
    database:process.env.MYSQL_DATABASE,
    port:process.env.MYSQL_PORT
}).promise()

export async function getUsers() {
    const [result] = await pool.query(`SELECT name, image, description, role,email, phone, instagram, facebook, twitter FROM users WHERE id = ?`,[USER_ID]);
    return result;
}
export async function getEdus() {
    const [result] = await pool.query(`SELECT period,degree,institution FROM education WHERE user_id = ?`,[USER_ID]);
    return result;
}

export async function getSkills() {
    const [result] = await pool.query(`SELECT name FROM skills WHERE user_id = ?`,[USER_ID]);
    return result;
}

export async function getWorks() {
    const [result] = await pool.query(`SELECT company, role, period, description FROM work WHERE user_id = ?`,[USER_ID]);
    return result;
}

export async function getProjects() {
    const [result] = await pool.query(`SELECT name, description, image FROM projects WHERE user_id = ?`,[USER_ID]);
    return result;
}




