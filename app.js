import express from 'express';
import mainRoute from './router/route.js';
import rootDir from './utils/path.js';
import path from 'path';
import { getUsers } from './database.js';
import bodyParser from 'body-parser';


const app = express();
app.use(express.static(path.join(process.cwd(), 'public')));
app.use(bodyParser.urlencoded());
app.use(express.json());
app.set('view engine', 'ejs');
app.set('views', './views');
app.use(async (req, res, next) => {
    res.locals.users = await getUsers();
    next();
});
app.use(mainRoute);

app.use((req, res, next) => {
    res.status(404).render('404');
});
app.listen(process.env.PORT || 3000);
