using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using TrabajoTiendaZapatillas.Data;
using TrabajoTiendaZapatillas.Repositories;
using TrabajoTiendaZapatillas.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
string connectionString = builder.Configuration.GetConnectionString("SqlServer");
builder.Services.AddTransient<RepositoryZapatillas>();
builder.Services.AddDbContext<ZapatillasContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddTransient<ServiceApiUsuarios>();
builder.Services.AddTransient<ServiceApiZapatillas>();
//SEGURIDAD
builder.Services.AddAuthentication(options =>
{
    options.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
}).AddCookie(
    CookieAuthenticationDefaults.AuthenticationScheme,
    config =>
    {
        config.AccessDeniedPath = "/Managed/ErrorAcceso";
    });


builder.Services.AddSession();
builder.Services.AddControllersWithViews(options =>
options.EnableEndpointRouting = false)
    .AddSessionStateTempDataProvider();




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

app.UseAuthentication();
app.UseAuthorization();

app.UseSession();
app.UseMvc(route =>
{
    route.MapRoute(
        name: "default",
        template: "{controller=Tienda}/{action=Index}/{id?}");
});

app.Run();
