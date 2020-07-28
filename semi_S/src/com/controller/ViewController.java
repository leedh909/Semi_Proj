package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dao.AnswerDao;
import com.dao.BoardDao;
import com.dao.MapDao;
import com.dao.NewsDao;
import com.dao.PartsDao;
import com.dto.AnswerDto;
import com.dto.BoardDto;
import com.dto.CoolerDto;
import com.dto.FavPcDto;
import com.dto.GraphicDto;
import com.dto.GuideViewDto;
import com.dto.MapDto;
import com.dto.NewsDto;
import com.dto.PagingDto;
import com.dto.RamDto;

@WebServlet("/ViewController")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String command = request.getParameter("command");
		System.out.println("viewcontroller["+command+"]");
		
		if(command.equals("index")) {
			response.sendRedirect("index.jsp");
		}else if(command.equals("wordcho")) {
			response.sendRedirect("wordcho.jsp");
		}else if(command.equals("wordmid")) {
			response.sendRedirect("wordmid.jsp");
		}else if(command.equals("boardlist")) {
			
			BoardDao dao = new BoardDao();
			int currentPage;	
			int limit;			
			int lastPage;		 
			int startPage;		
			int endPage;		
			
			int listCt = dao.listCount();

			limit = 5;
			currentPage = 1;

			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			lastPage = (int)((double)listCt/limit + 0.9);
			startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
			endPage = startPage + limit - 1;
			
			if(lastPage < endPage) {
				endPage = lastPage;
			
			}
			
			PagingDto pg = new PagingDto(currentPage, listCt, limit, lastPage, startPage, endPage);	
			List<BoardDto> list = dao.pagingSelectAll(currentPage);	
			request.setAttribute("allList", list);
			request.setAttribute("pg", pg);

			RequestDispatcher dispath = request.getRequestDispatcher("boardlist.jsp");
			dispath.forward(request, response);
			
		}else if(command.equals("pcrec")) {
			response.sendRedirect("pcrec.jsp");
			
		}else if(command.equals("lowspec")) {
			String a = request.getParameter("spec");
			int num = Integer.parseInt(request.getParameter("no"));		
			String guideName = a+num;
			
			PartsDao dao = new PartsDao();
			 GuideViewDto dto = dao.selectlowspec(guideName);	
			 List<GuideViewDto> list = dao.selectAll();
			 List<GraphicDto> gList = dao.selectGpu();
			 List<CoolerDto> cList = dao.selectCooler();
			 List<RamDto> rList = dao.selectRam();
			request.setAttribute("list", list);
			request.setAttribute("gList", gList);
			request.setAttribute("cList", cList);
			request.setAttribute("rList", rList);
			 String def = "1";
			request.setAttribute("dto", dto);
			request.setAttribute("def", def);
			dispatch("spec.jsp",request,response);	
			
		}else if(command.equals("favsave")) {
			
			String spec = request.getParameter("spec");
			int no = Integer.parseInt(request.getParameter("no"));	
			
			String id = request.getParameter("id");
			String cpuN = request.getParameter("cpuname");
			
			int cpuP = Integer.parseInt(request.getParameter("cpuprice"));	
			String mainN = request.getParameter("mainname");
			int mainP = Integer.parseInt(request.getParameter("mainprice"));
			String ramN = request.getParameter("ramname");
			int ramP = Integer.parseInt(request.getParameter("ramprice"));
			int ramA = Integer.parseInt(request.getParameter("ramamount"));
			String gpuN = request.getParameter("gpuname");
			int gpuP = Integer.parseInt(request.getParameter("gpuprice"));
			String ssdN = request.getParameter("ssdname");
			int ssdP = Integer.parseInt(request.getParameter("ssdprice"));
			int ssdA = Integer.parseInt(request.getParameter("ssdamount"));	
			String coolN = request.getParameter("coolname");
			int coolP = Integer.parseInt(request.getParameter("coolprice"));
			String powerN = request.getParameter("powername");
			int powerP = Integer.parseInt(request.getParameter("powerprice"));			
			String caseN = request.getParameter("casename");
			int caseP = Integer.parseInt(request.getParameter("caseprice"));	
			int totalP  = Integer.parseInt(request.getParameter("totalprice"));	
			
			FavPcDto dto = new FavPcDto(id,cpuN,cpuP,mainN,mainP,ramN,ramP,ramA,gpuN,gpuP,ssdN,ssdP,ssdA,coolN,coolP,powerN,powerP,caseN,caseP,totalP);
			
			PartsDao dao = new PartsDao();
			
			int res = dao.favsave(dto);
			
			if(res>0) {
				jsResponse("해당 PC를 찜했습니다~", "ViewController?command=lowspec&spec="+spec+"&no="+no, response);
			}else {
				jsResponse("로그인을 해주세요!", "ViewController?command=lowspec&spec="+spec+"&no="+no, response);
			}
				
		

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		}else if(command.equals("mapfind")){
			int compNum = Integer.parseInt(request.getParameter("no"));	
			int def = 1;
			MapDao dao = new MapDao();
			 MapDto dto = dao.getmap(compNum);
			 

				request.setAttribute("dto", dto);		
				request.setAttribute("def", def);
				dispatch("map.jsp",request,response);	
			 
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}else if(command.equals("itnews")) {
			Document doc = Jsoup.connect("http://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=1").get();
			Elements list = doc.select(".post_list > ul > li");
			
			NewsDto dto = new NewsDto();
			NewsDao newsDao = new NewsDao();
			
			String link = "";	//뉴스링크
			String news = "";	//뉴스타이틀
			String img  = "";	//이미지링크
			int succCnt = 0;
			
			newsDao.deleteNews();
			
			for(Element li:list) { 
			  link = li.select("a").attr("href");
			  news = li.select(".thumb_title strong").html(); 
			  img  = li.select(".thumb_img").toString().split(" alt")[0].split("=")[1].replaceAll("\"", "");
			  
			  dto.setTitle(news);
			  dto.setUrl(link);
			  dto.setImg(img);
			  
			  succCnt = succCnt + newsDao.insertNews(dto);
			}
			
			NewsDao dao = new NewsDao();
			
			List<NewsDto> selectNewList = dao.selectAll();
			request.setAttribute("list", selectNewList);
			RequestDispatcher dispath = request.getRequestDispatcher("It_news.jsp");
			dispath.forward(request, response);
		}else if(command.equals("QNAlist")) {
			
			AnswerDao dao = new AnswerDao();
			List<AnswerDto> list = dao.selectAll();
			request.setAttribute("list", list);
			RequestDispatcher dispath = request.getRequestDispatcher("QNAlist.jsp");
			dispath.forward(request, response);
			

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('"+msg+"');"
						+"location.href='"+url+"';" + "</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}

}
