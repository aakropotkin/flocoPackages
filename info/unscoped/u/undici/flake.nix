{

  inputs.packument.url   = "https://registry.npmjs.org/undici?rev=130-f0cf8c555cba1050c58f435b44f97ae4";
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
    ident = "undici";
    ldir  = "info/unscoped/u/undici";
    inherit packument fetchInfo;
  } // latest';

}
