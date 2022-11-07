{

  inputs.packument.url   = "https://registry.npmjs.org/has-yarn?rev=7-aa0941276bd4451c58d83f1607073fb3";
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
    ident = "has-yarn";
    ldir  = "info/unscoped/h/has-yarn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
