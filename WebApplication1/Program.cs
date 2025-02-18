var builder = WebApplication.CreateBuilder(args);
builder.Services.AddRazorPages(); // ✅ Enable Razor Pages

var app = builder.Build();

app.UseStaticFiles();
app.UseRouting();

app.UsePathBase("/WebApplication1");
app.Use((context, next) =>
{
    if (context.Request.Path.StartsWithSegments("/WebApplication1", out var remaining))
    {
        context.Request.Path = remaining;
    }
    return next();
});

app.UseAuthorization();
app.MapRazorPages(); // ✅ Map Razor Pages

app.Run();
