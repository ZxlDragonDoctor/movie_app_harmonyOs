export class MoveNote{
  movieid: number
  title:string
  genre:string
  director:string
  releaseDate:string
  deleted:number
  poster:string
  profile:string
  link:string


  constructor(movieid?: number, title?:string, genre?:string, director?:string, releaseDate?:string, deleted?:number, poster?:string, profile?:string, link?:string) {
    this.movieid = movieid;
    this.title = title;
    this.genre = genre;
    this.director = director;
    this.releaseDate = releaseDate;
    this.deleted = deleted;
    this.poster = poster;
    this.profile = profile;
    this.link = link;
  }

}