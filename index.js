import dotenv from "dotenv";
import { CubejsServer } from "@cubejs-backend/server";
import winston from "winston";

dotenv.config();

const logger = winston.createLogger({
    level: "info",
    format: winston.format.combine(
        winston.format.timestamp({ format: "HH:mm:ss" }),
        winston.format.colorize(),
        winston.format.printf(({ level, message, timestamp }) => `[${timestamp}] ${level}: ${message}`)
    ),
    transports: [new winston.transports.Console()],
});

const server = new CubejsServer({
    apiSecret: process.env.CUBEJS_API_SECRET || "rc_dev_secret_key",
    devServer: true,
    // No need for dbType or driverFactory — pulled from .env
});

server.listen().then(({ version }) => {
    logger.info(`🚀 Cube.js server ${version} is running on http://localhost:4000`);
});
