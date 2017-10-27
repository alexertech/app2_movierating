# 12 weeks 12 apps challenge

## Week 2 - Movie rating

### Goal

- CRUD for movies
- User sessions and register
- Up / Down votes
- Boostrap and styling

## Model

**Movie**
name:string
summary:string
rating:references
comment:refferences

**Rating**
vote:integer
user:references

**Comment**
comment:string
user:references

**User**
email:string
password:string

