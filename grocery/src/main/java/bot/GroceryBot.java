package bot;

import java.sql.Connection;
import java.util.List;

import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.methods.send.SendPhoto;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import com.DataBase.DatabaseConnect;
import com.entity.itemDetails;

public class GroceryBot extends TelegramLongPollingBot {

	@Override
	public String getBotUsername() {
		return "@SREEKUTUMBHbot";
	}

	@Override
	public String getBotToken() {
		return "7237341967:AAF8K5j6omfsSxBherzYeFym-nf-VDYnkSk";
	}

	@Override
	public void onUpdateReceived(Update update) {
		System.out.println(update.getMessage().getText());
		Long chatId = update.getMessage().getChatId();
		if(update.getMessage().getText().equals("/start")) {
			SendMessage sm = new SendMessage(update.getMessage().getChatId().toString(),
					"Hiii. Welcome to SREEKUTUMBHbot Shopping Store");
			try {
				execute(sm);
			} catch (TelegramApiException e) {
				e.printStackTrace();
			}
		}
		if(update.getMessage().getText().equals("/recent")) {
			showRecentItems(chatId);
			
		}

	}
	
	
	 private void showRecentItems(Long chatId) {
	        try (Connection conn = DatabaseConnect.getConn()) {
	            ItemDAOImplgrocery itemDAO = new ItemDAOImplgrocery(conn);
	            List<itemDetails> items = itemDAO.getRecentItems();
	            for (itemDetails item : items) {
	                StringBuilder itemDetails = new StringBuilder();
	                itemDetails.append("Name: ").append(item.getitemName()).append("\n");
	                itemDetails.append("Author: ").append(item.getAuth()).append("\n");
	                itemDetails.append("Price: ").append(item.getPrice()).append("\n");
	                itemDetails.append("Category: ").append(item.getitemCatogery()).append("\n");

	                SendPhoto photoMessage = new SendPhoto();
	                photoMessage.setChatId(chatId.toString());
	                photoMessage.setPhoto(new java.io.File("../img/" + item.getPhotoName()));
	                photoMessage.setCaption(itemDetails.toString());
	                try {
	                    execute(photoMessage);
	                } catch (TelegramApiException e) {
	                    e.printStackTrace();
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
}
