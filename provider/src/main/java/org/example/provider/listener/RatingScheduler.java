package org.example.provider.listener;

import org.example.provider.dao.PlaceDAO;
import org.example.provider.services.PlaceService;
import org.example.provider.services.impl.PlaceServiceImpl;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class RatingScheduler {
    private final PlaceService placeService = new PlaceServiceImpl();
    private final ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

    public void startScheduler() {
        scheduler.scheduleAtFixedRate(() -> {
            try {
                placeService.recalculateAllPlaceRatings();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }, 0, 30, TimeUnit.SECONDS);
    }

    public void stopScheduler() {
        scheduler.shutdown();
    }
}
