{

  inputs.packument.url   = "https://registry.npmjs.org/@angular/platform-browser-dynamic?rev=690-f9febc20c08ffc865bcc0dc9d89a493a";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@angular";
    ident = "@angular/platform-browser-dynamic";
    ldir  = "info/angular/platform-browser-dynamic";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
