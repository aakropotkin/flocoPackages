{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-extendable?_rev=8-b959479f24ec67b00de005b2538d3e31";
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
    ident = "is-extendable";
    ldir  = "info/unscoped/i/is-extendable";
    inherit packument fetchInfo;
  } // latest';

}
