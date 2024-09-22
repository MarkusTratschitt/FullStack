import { createApp, toNodeListener } from 'h3';
import { createServer } from 'http';
import { PrismaClient } from '@prisma/client';
import authMiddleware from "../server/middleware/auth";

// create h3-app
const app = createApp();
const prisma = new PrismaClient();

// Middleware for authentication
app.use(authMiddleware);

// Register API routes
app.use('/api/auth', defineEventHandler(async (event) => {
    const body = await readBody(event);
    return { message: 'Login erfolgreich', user: body }
}));

// Start the server
const server = createServer(toNodeListener(app));
server.listen(8000, () => {
    console.log("BackendServer started on http://localhost:8000");
});
function defineEventHandler(arg0: (event: any) => Promise<{ message: string; user: any; }>): import("h3").EventHandler<import("h3").EventHandlerRequest, any> | import("h3").EventHandler<import("h3").EventHandlerRequest, any>[] {
    throw new Error('Function not implemented.');
}

function readBody(event: any) {
    throw new Error('Function not implemented.');
}

