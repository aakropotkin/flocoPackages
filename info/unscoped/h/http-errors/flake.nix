{

  inputs.packument.url   = "https://registry.npmjs.org/http-errors?rev=95-dc4448750553781e2658d3be3cbbf297";
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
    ident = "http-errors";
    ldir  = "info/unscoped/h/http-errors";
    inherit packument fetchInfo;
  } // latest';

}
