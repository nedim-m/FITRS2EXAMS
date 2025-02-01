

using exam.Model.ToDo4924;
using exam.Services.IServices;

namespace exam.Controllers
{
    public class ToDo4924Controller : BaseCRUDController<ToDo4924, ToDo4924SearchObject, ToDo4924InsertRequest, ToDo4924InsertRequest>
    {
        public ToDo4924Controller(ILogger<BaseController<ToDo4924, ToDo4924SearchObject>> logger, IToDo4924Service service) : base(logger, service)
        {
        }
    }
}
