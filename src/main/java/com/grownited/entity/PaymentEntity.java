package com.grownited.entity;

import java.time.LocalDate;

//this entity is not for codeverse 
//
public class PaymentEntity {
	Integer paymentId;

	Integer orderId;
	Double amount;
	String paymentMode;
	String gateway;
	String paymentStatus;
	LocalDate paymentDate;
	String paymentGatewayTransactionId;
	String paymentGatewayAuthCode;

	public Integer getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Integer paymentId) {
		this.paymentId = paymentId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getGateway() {
		return gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public LocalDate getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(LocalDate paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentGatewayTransactionId() {
		return paymentGatewayTransactionId;
	}

	public void setPaymentGatewayTransactionId(String paymentGatewayTransactionId) {
		this.paymentGatewayTransactionId = paymentGatewayTransactionId;
	}

	public String getPaymentGatewayAuthCode() {
		return paymentGatewayAuthCode;
	}

	public void setPaymentGatewayAuthCode(String paymentGatewayAuthCode) {
		this.paymentGatewayAuthCode = paymentGatewayAuthCode;
	}

}
