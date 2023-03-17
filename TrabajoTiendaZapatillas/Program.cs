using Microsoft.EntityFrameworkCore;
using TrabajoTiendaZapatillas.Data;
using TrabajoTiendaZapatillas.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
string connectionString = builder.Configuration.GetConnectionString("SqlZapatillas");
builder.Services.AddTransient<RepositoryZapatillas>();
builder.Services.AddTransient<RepositoryUsuarios>();
builder.Services.AddDbContext<ZapatillasContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddDbContext<UsuariosContext>(options => options.UseSqlServer(connectionString));


builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Tienda}/{action=Index}");

app.Run();
