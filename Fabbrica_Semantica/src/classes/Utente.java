package classes;

import java.util.ArrayList;

public class Utente {
	
	private final String email;
	private final String password;
	private ArrayList<String> linguePreferite;
	private ArrayList<String> lingueAggiuntive;
	
	private ArrayList<Test> tests;
	
	public Utente(String email, String password) {
		this.email=email;
		this.password=password;
		tests = new ArrayList<Test>();
		linguePreferite=new ArrayList<String>();
		lingueAggiuntive=new ArrayList<String>();
	}
	
	public String getPassword() {
		return password;
	}

	public ArrayList<Test> getTests() {
		return tests;
	}

	public void setTests(ArrayList<Test> tests) {
		this.tests = tests;
	}

	public String getEmail() {
		return email;
	}

	public ArrayList<String> getLinguePreferite() {
		return linguePreferite;
	}

	public ArrayList<String> getLingueAggiuntive() {
		return lingueAggiuntive;
	}
	
	public void setLinguePreferite(ArrayList<String> l) {
		this.linguePreferite=l;
	}
	
	public void setLingueAggiuntive(ArrayList<String> l) {
		this.lingueAggiuntive=l;
	}
	
	public void addTest(Test t) {
		tests.add(t);
	}
	
}
