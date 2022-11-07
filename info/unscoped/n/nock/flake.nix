{

  inputs.packument.url   = "https://registry.npmjs.org/nock?rev=873-95983a8125a1736b7492257220e34ee7";
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
    ident = "nock";
    ldir  = "info/unscoped/n/nock";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
