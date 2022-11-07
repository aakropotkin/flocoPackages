{

  inputs.packument.url   = "https://registry.npmjs.org/http-https?rev=4-7a4f0aa6817838563899ab8b884e5f8f";
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
    ident = "http-https";
    ldir  = "info/unscoped/h/http-https";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
