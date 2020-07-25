package com.dto;

public class GuideViewDto {
	private String guide;
	private String cpu;
	private int cpuPrice;
	private String cpuPic;
	private String mainboard;
	private int mainboardPrice;
	private String mainboardPic;
	private String ram;
	private int ramAmount;
	private int ramPrice;
	private String ramPic;
	private String gpu;
	private int gpuPrice; 
	private String gpuPic;
	private String ssd;
	private int ssdPrice;
	private String ssdPic;
	private int ssdAmount;
	private String cooler;
	private int coolerPrice;
	private String coolerPic;
	private String power;
	private int powerPrice; 
	private String powerPic;
	private String caseN;
	private int caseNPrice;
	private String caseNPic;
	private String catPic;
	
	public GuideViewDto() {
		super();
	}

	public GuideViewDto(String guide, String cpu, int cpuPrice, String cpuPic, String mainboard, int mainboardPrice,
			String mainboardPic, String ram, int ramAmount, int ramPrice, String ramPic, String gpu, int gpuPrice,
			String gpuPic, String ssd, int ssdPrice, String ssdPic, int ssdAmount, String cooler, int coolerPrice,
			String coolerPic, String power, int powerPrice, String powerPic, String caseN, int caseNPrice,
			String caseNPic, String catPic) {
		super();
		this.guide = guide;
		this.cpu = cpu;
		this.cpuPrice = cpuPrice;
		this.cpuPic = cpuPic;
		this.mainboard = mainboard;
		this.mainboardPrice = mainboardPrice;
		this.mainboardPic = mainboardPic;
		this.ram = ram;
		this.ramAmount = ramAmount;
		this.ramPrice = ramPrice;
		this.ramPic = ramPic;
		this.gpu = gpu;
		this.gpuPrice = gpuPrice;
		this.gpuPic = gpuPic;
		this.ssd = ssd;
		this.ssdPrice = ssdPrice;
		this.ssdPic = ssdPic;
		this.ssdAmount = ssdAmount;
		this.cooler = cooler;
		this.coolerPrice = coolerPrice;
		this.coolerPic = coolerPic;
		this.power = power;
		this.powerPrice = powerPrice;
		this.powerPic = powerPic;
		this.caseN = caseN;
		this.caseNPrice = caseNPrice;
		this.caseNPic = caseNPic;
		this.catPic = catPic;
	}
	

	public int getSsdAmount() {
		return ssdAmount;
	}


	public void setSsdAmount(int ssdAmount) {
		this.ssdAmount = ssdAmount;
	}


	public String getCatPic() {
		return catPic;
	}


	public void setCatPic(String catPic) {
		this.catPic = catPic;
	}


	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public int getCpuPrice() {
		return cpuPrice;
	}

	public void setCpuPrice(int cpuPrice) {
		this.cpuPrice = cpuPrice;
	}

	public String getCpuPic() {
		return cpuPic;
	}

	public void setCpuPic(String cpuPic) {
		this.cpuPic = cpuPic;
	}

	public String getMainboard() {
		return mainboard;
	}

	public void setMainboard(String mainboard) {
		this.mainboard = mainboard;
	}

	public int getMainboardPrice() {
		return mainboardPrice;
	}

	public void setMainboardPrice(int mainPrice) {
		this.mainboardPrice = mainPrice;
	}

	public String getMainboardPic() {
		return mainboardPic;
	}

	public void setMainboardPic(String mainboardPic) {
		this.mainboardPic = mainboardPic;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public int getRamAmount() {
		return ramAmount;
	}

	public void setRamAmount(int ramAmount) {
		this.ramAmount = ramAmount;
	}

	public int getRamPrice() {
		return ramPrice;
	}

	public void setRamPrice(int ramPrice) {
		this.ramPrice = ramPrice;
	}

	public String getRamPic() {
		return ramPic;
	}

	public void setRamPic(String ramPic) {
		this.ramPic = ramPic;
	}

	public String getGpu() {
		return gpu;
	}

	public void setGpu(String gpu) {
		this.gpu = gpu;
	}

	public int getGpuPrice() {
		return gpuPrice;
	}

	public void setGpuPrice(int gpuPrice) {
		this.gpuPrice = gpuPrice;
	}

	public String getGpuPic() {
		return gpuPic;
	}

	public void setGpuPic(String gpuPic) {
		this.gpuPic = gpuPic;
	}

	public String getSsd() {
		return ssd;
	}

	public void setSsd(String ssd) {
		this.ssd = ssd;
	}

	public int getSsdPrice() {
		return ssdPrice;
	}

	public void setSsdPrice(int ssdPrice) {
		this.ssdPrice = ssdPrice;
	}

	public String getSsdPic() {
		return ssdPic;
	}

	public void setSsdPic(String ssdPic) {
		this.ssdPic = ssdPic;
	}

	public String getCooler() {
		return cooler;
	}

	public void setCooler(String cooler) {
		this.cooler = cooler;
	}

	public int getCoolerPrice() {
		return coolerPrice;
	}

	public void setCoolerPrice(int coolerPrice) {
		this.coolerPrice = coolerPrice;
	}

	public String getCoolerPic() {
		return coolerPic;
	}

	public void setCoolerPic(String coolerPic) {
		this.coolerPic = coolerPic;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public int getPowerPrice() {
		return powerPrice;
	}

	public void setPowerPrice(int powerPrice) {
		this.powerPrice = powerPrice;
	}

	public String getPowerPic() {
		return powerPic;
	}

	public void setPowerPic(String powerPic) {
		this.powerPic = powerPic;
	}

	public String getCaseN() {
		return caseN;
	}

	public void setCaseN(String caseN) {
		this.caseN = caseN;
	}

	public int getCaseNPrice() {
		return caseNPrice;
	}

	public void setCaseNPrice(int casePrice) {
		this.caseNPrice = casePrice;
	}

	public String getCaseNPic() {
		return caseNPic;
	}

	public void setCaseNPic(String casePic) {
		this.caseNPic = casePic;
	}
	
	
	

}
