from flask_wtf import FlaskForm
from wtforms import SubmitField, TextAreaField, IntegerField
from wtforms.validators import DataRequired
import random


class PostForm(FlaskForm):
    title = IntegerField('What is the image number?', validators=[DataRequired()])
    content = TextAreaField('Describe what you see on the image above', validators=[DataRequired()])
    submit = SubmitField('Submit')
