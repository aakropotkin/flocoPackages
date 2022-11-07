{

  inputs.packument.url   = "https://registry.npmjs.org/object-path?rev=116-456c90e5f2365ff6c106de492e9538d0";
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
    ident = "object-path";
    ldir  = "info/unscoped/o/object-path";
    inherit packument fetchInfo;
  } // latest';

}
