using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace UsersService.Domain.Responses
{
    public  class GeneralResponse
    {
        public HttpStatusCode StatusCode {get;set;}
        public string Description { get;set;}
    }
}
