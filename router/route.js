import express from 'express';
import rootDir from '../utils/path.js';
import { getEdus, getProjects, getSkills, getUsers, getWorks } from '../database.js';
import nodemailer from 'nodemailer'
import dotenv from 'dotenv'
dotenv.config()
const router = express.Router();
const getEmail=await getUsers();
const Dev_Email=getEmail[0].email;

const transporter= nodemailer.createTransport({
    service:"gmail",
    auth:{
        user:process.env.USER_EMAIL,
        pass:process.env.USER_PASSWORD
    }
})

//router

router.get('/', async (req, res, next) => {
    res.render('main', { title: 'Muthu', path: 'main'});
});

router.get('/contact',async (req, res) => {
    res.render('contact', { title: 'Contact Muthu', path: 'contact'});
});

router.get('/project', async (req, res, next) => {
    const projects = await getProjects();
    res.render('project', { title: 'Projects', path: 'project', projects});
});

router.get('/resume', async (req, res, next) => {
    const edu = await getEdus();
    const skills = await getSkills();
    const works = await getWorks();
    res.render('resume', { title: 'Resume', path: 'resume', edu, skills, works});
});

router.post('/contact', async (req, res, next) => {
  const val = req.body;
  const mailOptions = {
    from: process.env.USER_EMAIL,
    to: Dev_Email,
    subject: `Text From ${val.name}`,
    text: `Name: ${val.name}\nEmail: ${val.email}\nMessage: \n\n ${val.message}`
  };
  try {
    const info = await transporter.sendMail(mailOptions);
    console.log('Email sent:', info.response);
  } catch (error) {
    console.log('Error sending email:', error);
  }
  res.render('contact', { title: 'Contact Muthu', path: 'contact' });
});



export default router;