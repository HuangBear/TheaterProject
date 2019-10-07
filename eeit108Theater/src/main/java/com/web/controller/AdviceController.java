//package com.web.controller;
//
//import org.springframework.beans.ConversionNotSupportedException;
//import org.springframework.beans.TypeMismatchException;
//import org.springframework.http.converter.HttpMessageNotReadableException;
//import org.springframework.http.converter.HttpMessageNotWritableException;
//import org.springframework.web.bind.MissingServletRequestParameterException;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//@ControllerAdvice
//public class AdviceController {
//	// 404
//	 @ExceptionHandler(NoHandlerFoundException.class)
//	    public String handle(Exception ex) {
//		 System.err.println("error 404...");
//		 //ex.printStackTrace();
//	        return "404";
//	    }
//	// 400錯誤
//	@ExceptionHandler({ HttpMessageNotReadableException.class })
//	public String requestNotReadable(HttpMessageNotReadableException ex) {
//		System.err.println("error 400..requestNotReadable");
//		ex.printStackTrace();
//		return "404";
//	}
//
//	// 400錯誤
//	@ExceptionHandler({ TypeMismatchException.class })
//	public String requestTypeMismatch(TypeMismatchException ex) {
//		System.err.println("error 400..TypeMismatchException");
//		ex.printStackTrace();
//		return "404";
//	}
//
//	// 400錯誤
//	@ExceptionHandler({ MissingServletRequestParameterException.class })
//	public String requestMissingServletRequest(MissingServletRequestParameterException ex) {
//		System.err.println("error 400..MissingServletRequest");
//		ex.printStackTrace();
//		return "404";
//	}
//
//	// 500錯誤
//	@ExceptionHandler({ ConversionNotSupportedException.class,
//			HttpMessageNotWritableException.class })
//	public String server500(RuntimeException ex) {
//		System.err.println("error 500...");
//		ex.printStackTrace();
//		return "404";
//	}
//
//	@RequestMapping(value = { "/404" }, method = RequestMethod.GET)
//	public String NotFoudPage() {
//		return "404";
//
//	}
//
//	// 其他錯誤
//	@ExceptionHandler({ Exception.class })
//	public String exception(Exception ex) {
//		System.err.println("其他錯誤");
//		ex.printStackTrace();
//
//		return "404";
//	}
//}
