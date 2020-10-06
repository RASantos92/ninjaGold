package com.displaydate.controllers;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homecontroller.models.Player;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index(Model model, HttpSession session) {
		Player player = (Player) session.getAttribute("player");
		if (player == null) {
			session.setAttribute("player", new Player());
		}
		return "index.jsp";
	}

	@PostMapping("/action/farm")
	public String farm(HttpSession session) {
		Random rand = new Random();
		Player player = (Player) session.getAttribute("player");
		Integer income = (rand.nextInt(30));
		player.gold += income;
		player.addToTasks("Your farmed up " + income + "$");
		return "redirect:/";
	}

	@PostMapping("/action/casino")
	public String casino(HttpSession session) {
		Random rand = new Random();
		Player player = (Player) session.getAttribute("player");
		Integer income = (rand.nextInt(20) - 9);
		if (player.gold <= 0) {
			player.addToTasks("Sorry but you need to have money to gamble.");
		} else {
			if (income > 0) {
				player.addToTasks("Congratulations you won " + (income) + "$");
				player.gold += income;
			} else {
				player.addToTasks("Im sorry but you have lost " + (income) + "$");
				player.gold += income;
			}
		}

		return "redirect:/";
	}

	@PostMapping("/action/house")
	public String home(HttpSession session) {
		Random rand = new Random();
		Player player = (Player) session.getAttribute("player");
		Integer income = (rand.nextInt(10));
		player.gold += income;
		player.addToTasks("You found " + income + "$ in your couch!");
		return "redirect:/";
	}

	@PostMapping("/action/programming")
	public String program(HttpSession session) {
		Random rand = new Random();
		Player player = (Player) session.getAttribute("player");
		Integer income = (rand.nextInt(800));
		player.gold += income;
		player.addToTasks("You spent the day programming and made " + income + "$");
		return "redirect:/";
	}

}
