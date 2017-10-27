# 12 weeks 12 apps challenge

## Week 2 - Movie rating

### Goal

- CRUD for movies
- User sessions and register
- Up / Down votes
- Boostrap and styling

## Model

**Movie**
```
title:string
summary:string
```

**User**
```
email:string
password:string
````

**Rating**
```
vote:integer   (1 up, 2 down)
comment:string
user:references
movie:references
```

