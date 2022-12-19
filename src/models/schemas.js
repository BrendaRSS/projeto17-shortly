import joi from "joi";

export const userSchema = joi.object({
    name: joi.string().min(3).required(),
    email: joi.string().email().required(),
    password: joi.string().min(4).required(),
    confirmPassword: joi.ref("password")
});