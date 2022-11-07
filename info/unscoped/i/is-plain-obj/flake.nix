{

  inputs.packument.url   = "https://registry.npmjs.org/is-plain-obj?rev=13-5b3780227b36fd08b221339158739d34";
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
    ident = "is-plain-obj";
    ldir  = "info/unscoped/i/is-plain-obj";
    inherit packument fetchInfo;
  } // latest';

}
