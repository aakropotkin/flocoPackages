{

  inputs.packument.url   = "https://registry.npmjs.org/rc-steps?rev=97-fa6b41b88dd231203c23564d213a2376";
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
    ident = "rc-steps";
    ldir  = "info/unscoped/r/rc-steps";
    inherit packument fetchInfo;
  } // latest';

}
