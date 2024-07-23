package com.groceryapp.bot;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;

import jakarta.servlet.ServletContextEvent;

@WebListener
public abstract class BotConfig implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        try {
            TelegramBotsApi botsApi = new TelegramBotsApi(DefaultBotSession.class);
            botsApi.registerBot(new GroceryBot());
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        // Clean up resources if needed
    }
}
