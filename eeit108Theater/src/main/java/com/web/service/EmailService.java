package com.web.service;

import javax.mail.MessagingException;

import com.web.entity.OrderBean;

public interface EmailService {
	/**
	 * Send an order-detail email to order's owner
	 * @param ob an order which is already complete
	 * @throws MessagingException
	 */
	void sendEmail(OrderBean ob) throws MessagingException;
	/**
	 * Send an text email
	 * @param to the email address to send
	 * @param subject email subject
	 * @param context email context 
	 * @throws MessagingException
	 */
	void sendEmail(String to, String subject, String context) throws MessagingException;
	
	/**
	 * Send an text-or-HTML email
	 * @param to the email address to send
	 * @param subject email subject
	 * @param context email context
	 * @param html true for apply content type "text/html" for an HTML mail; false for using default content type ("text/plain")
	 * @throws MessagingException
	 */
	void sendEmail(String to, String subject, String context, boolean html) throws MessagingException;
}
