{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/function.prototype.name?_rev=16-8fd70b0fa59a028932bddd5594123c9a";
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
    ident = "function.prototype.name";
    ldir  = "info/unscoped/f/function.prototype.name";
    inherit packument fetchInfo;
  } // latest';

}
