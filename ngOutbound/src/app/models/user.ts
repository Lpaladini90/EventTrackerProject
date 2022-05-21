export class User {

  id: number | null;
  username: string | null;
  password: string | null;
  email: string | null;
  firstName: string | null;
  lastName: string | null;
  role: string | null;
  description: string | null;
  phone: string | null;

  constructor(
    id: number = 0,
    username: string = '',
    password: string = '',
    email: string = '',
    firstName: string= "",
    lastName: string ="",
    role: string ="",
    description: string ="",
    phone: string = ""


  ) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.role = role;
    this.description = description;
    this.phone = phone;

  }

}
