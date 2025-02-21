using exam.Security;
using exam.Services.Database;
using exam.Services.IServices;
using exam.Services.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);//ovdje mi baca gresku? zaszto?

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.AddSecurityDefinition("basicAuth", new Microsoft.OpenApi.Models.OpenApiSecurityScheme()
    {
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme = "basic"
    });

    c.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference{Type = ReferenceType.SecurityScheme, Id = "basicAuth"}
            },
            new string[]{}
    } });

});
builder.Services.AddTransient<IKorisnikService, KorisnikService>();
builder.Services.AddTransient<IFITPasosService, FITPasosService>();
builder.Services.AddTransient<IToDo4924Service, ToDo4924Service>();
builder.Services.AddTransient<IMoodTrackerService, MoodTrackerService>();
builder.Services.AddTransient<IRadniProstorService, RadniProstorService>();
builder.Services.AddTransient<IRezervacijaProstora20022025Service, RezervacijaProstora20022025Service>();

builder.Services.AddAutoMapper(typeof(KorisnikService));



builder.Services.AddDbContext<ExamContext>(options =>
   options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();
using (var scope = app.Services.CreateScope())
{
    var dataContext = scope.ServiceProvider.GetRequiredService<ExamContext>();

    dataContext.Database.Migrate();
}


app.Run();