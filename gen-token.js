import jwt from "jsonwebtoken";

const token = jwt.sign({}, "rc-secret", { expiresIn: "7d" });
console.log(token);
