{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-stream-ended?_rev=8-99c3bc4dde602df139c181c7d7c7d846";
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
    ident = "is-stream-ended";
    ldir  = "info/unscoped/i/is-stream-ended";
    inherit packument fetchInfo;
  } // latest';

}
