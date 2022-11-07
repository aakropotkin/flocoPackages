{

  inputs.packument.url   = "https://registry.npmjs.org/base64id?rev=15-7abcd0c7cabefc78b8bc892d357e4192";
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
    ident = "base64id";
    ldir  = "info/unscoped/b/base64id";
    inherit packument fetchInfo;
  } // latest';

}
