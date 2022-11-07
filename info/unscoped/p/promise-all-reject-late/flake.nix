{

  inputs.packument.url   = "https://registry.npmjs.org/promise-all-reject-late?rev=2-30cbe596b1ace17a054432fb97e27eac";
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
    ident = "promise-all-reject-late";
    ldir  = "info/unscoped/p/promise-all-reject-late";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
