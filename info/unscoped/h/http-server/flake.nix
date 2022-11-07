{

  inputs.packument.url   = "https://registry.npmjs.org/http-server?rev=702-a85cb04a4342fc1b9d1fb2017bf0034f";
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
    scope = null;
    ident = "http-server";
    ldir  = "info/unscoped/h/http-server";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
