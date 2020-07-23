package com.dto;

public class FavPcDto {
	
	private int favNum; 
	private String id;
	private String cpuName;
	private int cpuPrice;
	private String mbName;
	private int mbPrice;
	private String ramName;
	private int ramPrice;
	private int ramAmount;
	private String graphicName;
	private int graphicPrice;
	private String ssdName;
	private int ssdPrice;
	private int ssdAmount;
	private String coolName;
	private int coolPrice;
	private String powerName;
	private int powerPrice;
	private String caseName;
	private int casePrice;
	private int totalPrice;
	
	public FavPcDto() {
		super();
	}

	public FavPcDto(int favNum, String id, String cpuName, int cpuPrice, String mbName, int mbPrice, String ramName,
			int ramPrice, int ramAmount, String graphicName, int graphicPrice, String ssdName, int ssdPrice,
			int ssdAmount, String coolName, int coolPrice, String powerName, int powerPrice, String caseName,
			int casePrice, int totalPrice) {
		super();
		this.favNum = favNum;
		this.id = id;
		this.cpuName = cpuName;
		this.cpuPrice = cpuPrice;
		this.mbName = mbName;
		this.mbPrice = mbPrice;
		this.ramName = ramName;
		this.ramPrice = ramPrice;
		this.ramAmount = ramAmount;
		this.graphicName = graphicName;
		this.graphicPrice = graphicPrice;
		this.ssdName = ssdName;
		this.ssdPrice = ssdPrice;
		this.ssdAmount = ssdAmount;
		this.coolName = coolName;
		this.coolPrice = coolPrice;
		this.powerName = powerName;
		this.powerPrice = powerPrice;
		this.caseName = caseName;
		this.casePrice = casePrice;
		this.totalPrice = totalPrice;
	}
	
	public FavPcDto(String id, String cpuName, int cpuPrice, String mbName, int mbPrice, String ramName,
			int ramPrice, int ramAmount, String graphicName, int graphicPrice, String ssdName, int ssdPrice,
			int ssdAmount, String coolName, int coolPrice, String powerName, int powerPrice, String caseName,
			int casePrice, int totalPrice) {
		super();
		this.id = id;
		this.cpuName = cpuName;
		this.cpuPrice = cpuPrice;
		this.mbName = mbName;
		this.mbPrice = mbPrice;
		this.ramName = ramName;
		this.ramPrice = ramPrice;
		this.ramAmount = ramAmount;
		this.graphicName = graphicName;
		this.graphicPrice = graphicPrice;
		this.ssdName = ssdName;
		this.ssdPrice = ssdPrice;
		this.ssdAmount = ssdAmount;
		this.coolName = coolName;
		this.coolPrice = coolPrice;
		this.powerName = powerName;
		this.powerPrice = powerPrice;
		this.caseName = caseName;
		this.casePrice = casePrice;
		this.totalPrice = totalPrice;
	}

	public int getFavNum() {
		return favNum;
	}

	public void setFavNum(int favNum) {
		this.favNum = favNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCpuName() {
		return cpuName;
	}

	public void setCpuName(String cpuName) {
		this.cpuName = cpuName;
	}

	public int getCpuPrice() {
		return cpuPrice;
	}

	public void setCpuPrice(int cpuPrice) {
		this.cpuPrice = cpuPrice;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public int getMbPrice() {
		return mbPrice;
	}

	public void setMbPrice(int mbPrice) {
		this.mbPrice = mbPrice;
	}

	public String getRamName() {
		return ramName;
	}

	public void setRamName(String ramName) {
		this.ramName = ramName;
	}

	public int getRamPrice() {
		return ramPrice;
	}

	public void setRamPrice(int ramPrice) {
		this.ramPrice = ramPrice;
	}

	public int getRamAmount() {
		return ramAmount;
	}

	public void setRamAmount(int ramAmount) {
		this.ramAmount = ramAmount;
	}

	public String getGraphicName() {
		return graphicName;
	}

	public void setGraphicName(String graphicName) {
		this.graphicName = graphicName;
	}

	public int getGraphicPrice() {
		return graphicPrice;
	}

	public void setGraphicPrice(int graphicPrice) {
		this.graphicPrice = graphicPrice;
	}

	public String getSsdName() {
		return ssdName;
	}

	public void setSsdName(String ssdName) {
		this.ssdName = ssdName;
	}

	public int getSsdPrice() {
		return ssdPrice;
	}

	public void setSsdPrice(int ssdPrice) {
		this.ssdPrice = ssdPrice;
	}

	public int getSsdAmount() {
		return ssdAmount;
	}

	public void setSsdAmount(int ssdAmount) {
		this.ssdAmount = ssdAmount;
	}

	public String getCoolName() {
		return coolName;
	}

	public void setCoolName(String coolName) {
		this.coolName = coolName;
	}

	public int getCoolPrice() {
		return coolPrice;
	}

	public void setCoolPrice(int coolPrice) {
		this.coolPrice = coolPrice;
	}

	public String getPowerName() {
		return powerName;
	}

	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}

	public int getPowerPrice() {
		return powerPrice;
	}

	public void setPowerPrice(int powerPrice) {
		this.powerPrice = powerPrice;
	}

	public String getCaseName() {
		return caseName;
	}

	public void setCaseName(String caseName) {
		this.caseName = caseName;
	}

	public int getCasePrice() {
		return casePrice;
	}

	public void setCasePrice(int casePrice) {
		this.casePrice = casePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
