{

  inputs.packument.url   = "https://registry.npmjs.org/@svgr/core?rev=44-4cc6e4087e31134dbe488fe8af2a5032";
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
    scope = "@svgr";
    ident = "@svgr/core";
    ldir  = "info/svgr/core";
    inherit packument fetchInfo;
  } // latest';

}
