{

  inputs.packument.url   = "https://registry.npmjs.org/prismjs?rev=76-3222d732f9c0e9b61728699797c57b5e";
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
    ident = "prismjs";
    ldir  = "info/unscoped/p/prismjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
