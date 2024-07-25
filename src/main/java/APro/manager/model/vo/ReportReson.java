package APro.manager.model.vo;

public class ReportReson {
	
	private String resonReport;
	private String reportDate;
	
	public ReportReson() {}

	public String getResonReport() {
		return resonReport;
	}

	public void setResonReport(String resonReport) {
		this.resonReport = resonReport;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "ReportReson [resonReport=" + resonReport + ", reportDate=" + reportDate + "]";
	}
	
	

}
