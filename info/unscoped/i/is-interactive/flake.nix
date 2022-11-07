{

  inputs.packument.url   = "https://registry.npmjs.org/is-interactive?rev=3-8f6f6f855d138b640e2a81d337d7612a";
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
    ident = "is-interactive";
    ldir  = "info/unscoped/i/is-interactive";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
