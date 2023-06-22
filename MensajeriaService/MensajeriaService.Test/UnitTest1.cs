using System.Net;
using MensajeriaService.Domain.Entities;
using MensajeriaService.Domain.Interfaces;
using MensajeriaService.Domain.Services;
using Microsoft.Extensions.Configuration;
using MensajeriaService.Infrastructure.WhatsappApi;
using Moq;


namespace MensajeriaService.Test
{
    public class UnitTest1
    {
        [Fact]
        public async Task SendSMS_ReturnsTrue_WhenMessageSentSuccessfully()
        {
            // Arrange
            var messagingApi = new Mock<IMessagingApi>();
            messagingApi.Setup(api => api.SendSMS(It.IsAny<MessageData>())).Returns(Task.FromResult(true));
            var messageService = new MessageService(messagingApi.Object);
            var messageData = new MessageData
            {
                Phone = "+123456789",
                Message = "Hello, world!"
            };

            // Act
            var result = await messageService.SendSMS(messageData);

            // Assert
            Assert.True(result);
        }

        [Fact]
        public async Task SendSMS_ReturnsFalse_WhenMessageSendingFails()
        {
            // Arrange
            var messagingApi = new Mock<IMessagingApi>();
            messagingApi.Setup(api => api.SendSMS(It.IsAny<MessageData>())).Returns(Task.FromResult(false));
            var messageService = new MessageService(messagingApi.Object);
            var messageData = new MessageData
            {
                Phone = "+123456789",
                Message = "Hello, world!"
            };

            // Act
            var result = await messageService.SendSMS(messageData);

            // Assert
            Assert.False(result);
        }

        [Fact]
        public async Task SendWhatsapp_ReturnsTrue_WhenMessageSentSuccessfully()
        {
            // Arrange
            var messagingApi = new Mock<IMessagingApi>();
            messagingApi.Setup(api => api.SendWhatsapp(It.IsAny<MessageData>())).Returns(Task.FromResult(true));
            var messageService = new MessageService(messagingApi.Object);
            var messageData = new MessageData
            {
                Phone = "+123456789",
                Message = "Hello, world!"
            };

            // Act
            var result = await messageService.SendWhatsapp(messageData);

            // Assert
            Assert.True(result);
        }

        [Fact]
        public async Task SendWhatsapp_ReturnsFalse_WhenMessageSendingFails()
        {
            // Arrange
            var messagingApi = new Mock<IMessagingApi>();
            messagingApi.Setup(api => api.SendWhatsapp(It.IsAny<MessageData>())).Returns(Task.FromResult(false));
            var messageService = new MessageService(messagingApi.Object);
            var messageData = new MessageData
            {
                Phone = "+123456789",
                Message = "Hello, world!"
            };

            // Act
            var result = await messageService.SendWhatsapp(messageData);

            // Assert
            Assert.False(result);
        }
    }

    public class MessagingApiTests
    {
        //[Fact]
        //public async Task SendSMS_ReturnsTrue_WhenMessageSentSuccessfully()
        //{
        //    // Arrange
        //    var configuration = new Mock<IConfiguration>();
        //    configuration.Setup(config => config["Twilio:Sid"]).Returns("AC28ec0f6e31122f60cdc3f133d2253238");
        //    configuration.Setup(config => config["Twilio:Token"]).Returns("6884f7904a8606d414cef7bed793031e");
        //    configuration.Setup(config => config["Twilio:Number"]).Returns("+13614709220");
        //    var messagingApi = new MessagingApi(configuration.Object);
        //    var messageData = new MessageData
        //    {
        //        Phone = "+573232426928",
        //        Message = "Hello, world!"
        //    };

        //    // Act
        //    var result = await messagingApi.SendSMS(messageData);

        //    // Assert
        //    Assert.True(result);
        //}

        [Fact]
        public async Task SendSMS_ReturnsFalse_WhenMessageSendingFails()
        {
            // Arrange
            var configuration = new Mock<IConfiguration>();
            configuration.Setup(config => config["Twilio:Sid"]).Returns("AC28ec0f6e31122f60cdc3f133d2253238");
            configuration.Setup(config => config["Twilio:Token"]).Returns("6884f7904a8606d414cef7bed793031e");
            configuration.Setup(config => config["Twilio:Number"]).Returns("+13614709220");
            var messagingApi = new MessagingApi(configuration.Object);
            var messageData = new MessageData
            {
                Message = "Hello, world!"
            };

            // Act
            var result = await messagingApi.SendSMS(messageData);

            // Assert
            Assert.False(result);
        }

        [Fact]
        public async Task SendWhatsapp_ReturnsFalse_WhenMessageSendingFails()
        {
            // Arrange
            var configuration = new Mock<IConfiguration>();
            configuration.Setup(config => config["Twilio:Sid"]).Returns("AC28ec0f6e31122f60cdc3f133d2253238");
            configuration.Setup(config => config["Twilio:Token"]).Returns("6884f7904a8606d414cef7bed793031e");
            configuration.Setup(config => config["Twilio:Number"]).Returns("+13614709220");
            var messagingApi = new MessagingApi(configuration.Object);
            var messageData = new MessageData
            {
                Phone = "+573232426928",
                Message = "Hello, world!"
            };

            // Act
            var result = await messagingApi.SendWhatsapp(messageData);

            // Assert
            Assert.False(result);
        }
    }
}