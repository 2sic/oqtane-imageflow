# ImageFlow Oqtane module

Image processing and optimizing middleware with querystring API for [Oqtane](https://www.oqtane.org/) 2.x.




# Install Imageflow module in Oqtane

Install it in standard way, as any other oqtane module.

## TODO - Option a)

1. Open **Module Management** in **Admin Dashboard**. On **Download** tab find **ImageFlow** in list of modules. Click on its **Download** button. After download click on **Install**.

## Option b)

1. From https://github.com/2sic/oqtane-imageflow/releases download latest _ToSic.ImageFlow.Oqt.x.x.x-*.nupkg_.

2. Open **Module Management** in **Admin Dashboard** and select **Upload** tab. **Upload** _ToSic.ImageFlow.Oqt.x.x.x-*.nupkg_ and **Install**,

## Option c)

1. From https://github.com/2sic/oqtane-imageflow/releases download latest _ToSic.ImageFlow.Oqt.x.x.x-*.nupkg_.

1. Just copy _ToSic.ImageFlow.Oqt.x.x.x-*.nupkg_ package to your `Oqtane.Server\wwwroot\Modules\` and next oqtane website restart will auto-install Imageflow module as part of oqtane application startup process.


# TODO - Development in Oqtane.Framework with ImageFlow nuget dependency

1. It is required to have [Oqtane.Framework](https://github.com/oqtane/oqtane.framework) development environment in folder **oqtane.framework**.
    ```
    git clone https://github.com/oqtane/oqtane.framework.git
    ```

1. In Visual Studio open `oqtane.framework\Oqtane.sln`.

1. Open **Manage nuget packages for solution..**, find _ToSic.ImageFlow.Oqt_ nuget package and **Install** to **Oqtane.Server** project as dependency.

    ![](Doc/images/install-nuget-package.png)

1. Or, from https://github.com/2sic/oqtane-imageflow/releases download latest _ToSic.ImageFlow.Oqt.x.x.x-*.nupkg_ and just copy _ToSic.ImageFlow.Oqt.x.x.x-*.nupkg_ package to your `Oqtane.Server\wwwroot\Modules\`


# Develop ImageFlow module in Oqtane.Framework

1. It is required to have [Oqtane.Framework](https://github.com/oqtane/oqtane.framework) development environment in folder **oqtane.framework**.
    ```
    git clone https://github.com/oqtane/oqtane.framework.git
    ```
1. By convention if you place the [ImageFlow module](https://github.com/2sic/oqtane-imageflow) root folder at the same level as the **oqtane.framework**, then you will not have to modify any folder configuration in the `oqtane-imageflow\Src\Package\ToSic.ImageFlow.Oqt.Package.csproj` project.
    ```
    git clone https://github.com/2sic/oqtane-imageflow.git
    ```
## How to deploy ImageFlow to Oqtane.Framework?

1. In Visual Studio open `oqtane-imageflow\Src\ToSic.ImageFlow.Oqt.sln`.

1. Build **Debug** or **Release** configuration and script will deploy ImageFlow module to Oqtane.Framework.

1. In Visual Studio open `oqtane.framework\Oqtane.sln` and Run it.


## How to locally package ToSic.ImageFlow.Oqt.x.x.x-*.nupkg?

1. Build release version and pack to ToSic.ImageFlow.Oqt.x.x.x-*.nupkg
    ```
    cd InstallPackages
    pack.cmd
    ```


# Optionally add ImageFlow module to Admin Dashboard

1. Open your oqtane website in browser and login as host.

1. Add new page ImageFlow to Admin dashboard with 'image' icon.

    ![](Doc/images/add-page-imageflow.png)

1. Open page ImageFlow from Admin dashboard.

    ![](Doc/images/open-page-imageflow.png)

1. Add new admin module ImageFlow to ImageFlow page.

    ![](Doc/images/add-module-imageflow.png)

1. If you can see all images under Querystring Examples than Imageflow is installed OK.

    ![](Doc/images/imageflow-module.png)
## More info

1. [Querystring API documentation](https://docs.imageflow.io/querystring/introduction.html)
1. [Imageflow.NET Server](https://github.com/imazen/imageflow-dotnet-server)
1. [Imageflow](https://www.imageflow.io/)
1. [Oqtane](https://github.com/oqtane/oqtane.framework)
