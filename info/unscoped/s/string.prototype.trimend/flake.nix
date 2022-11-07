{

  inputs.packument.url   = "https://registry.npmjs.org/string.prototype.trimend?rev=9-9b78a66e74cfadfe637e3d784922eb88";
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
    ident = "string.prototype.trimend";
    ldir  = "info/unscoped/s/string.prototype.trimend";
    inherit packument fetchInfo;
  } // latest';

}
