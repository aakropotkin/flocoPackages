{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/string.prototype.trimend?_rev=10-cb6920bdab1272e5386a12282a4bb3e3";
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
