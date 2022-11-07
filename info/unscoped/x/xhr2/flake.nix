{

  inputs.packument.url   = "https://registry.npmjs.org/xhr2?rev=43-44c854a40781e805f4b351ca772158e9";
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
    ident = "xhr2";
    ldir  = "info/unscoped/x/xhr2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
