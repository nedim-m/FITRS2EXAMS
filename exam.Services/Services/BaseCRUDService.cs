using AutoMapper;
using exam.Model;
using exam.Services.Database;
using exam.Services.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

 namespace exam.Services.Services
{
    public class BaseCRUDService<T, TDb, TSearch, TInsert, TUpdate> : BaseService<T, TDb, TSearch>
        where T : class where TDb : class where TSearch : BaseSearchObject
    {
        public BaseCRUDService(ExamContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public virtual async Task BeforeInsert(TDb entity, TInsert insert)
        {

        }

        public virtual async Task<T> Insert(TInsert insert)
        {
            var set = _context.Set<TDb>();

            TDb entity = _mapper.Map<TDb>(insert);

            set.Add(entity);
            await BeforeInsert(entity, insert);
            await _context.SaveChangesAsync();
            return _mapper.Map<T>(entity);
        }

        public virtual async Task<T> Update(int id, TUpdate update)
        {
            var set = _context.Set<TDb>();

            var entity = await set.FindAsync(id);
            if (entity is null)
            {
                throw new UserException("Entitet sa proslijedjenim Id ne postoji");
            }

            _mapper.Map(update, entity);

            await _context.SaveChangesAsync();
            return _mapper.Map<T>(entity);
        }

        public virtual async Task Delete(int id)
        {
            var set = _context.Set<TDb>();

            var entity = await set.FindAsync(id);

            if (entity is null)
            {
                throw new UserException("Entitet sa proslijedjenim Id ne postoji");
            }

            if (entity != null)
            {
                set.Remove(entity);

                await _context.SaveChangesAsync();
            }
        }
    }
}
