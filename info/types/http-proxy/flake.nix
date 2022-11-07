{

  inputs.packument.url   = "https://registry.npmjs.org/@types/http-proxy?rev=699-ebafa7d0566f975bdf02cfd41bd01a33";
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
    scope = "@types";
    ident = "@types/http-proxy";
    ldir  = "info/types/http-proxy";
    inherit packument fetchInfo;
  } // latest';

}
