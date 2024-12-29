export class shuju{
  user_id:number
  movie_id:number
  content :string
  createdAt:string



  constructor(user_id?: number, movie_id?: number, content?:string,createdAt?:string) {
    this.user_id =user_id
    this.movie_id=movie_id
    this.content=content
    this.createdAt = createdAt
  }

}