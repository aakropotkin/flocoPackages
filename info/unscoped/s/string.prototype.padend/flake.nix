{

  inputs.packument.url   = "https://registry.npmjs.org/string.prototype.padend?rev=13-8e741655103405f0e2b7946ec10ac401";
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
    ident = "string.prototype.padend";
    ldir  = "info/unscoped/s/string.prototype.padend";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
